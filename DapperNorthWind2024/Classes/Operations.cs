﻿using System.Data;
using Dapper;
using DapperNorthWind2024.Models;
using Microsoft.Data.SqlClient;

namespace DapperNorthWind2024.Classes;

public class Operations
{
    private IDbConnection db = new SqlConnection(ConnectionString());

    public int CategoryCount()
    {
        return db.QuerySingle<int>("SELECT COUNT(CategoryID) FROM dbo.Categories");
    }

    public List<Category> Categories()
    {
        var statement = 
            """
            SELECT CategoryID
                ,CategoryName
                ,[Description]
            FROM dbo.Categories
            """;

        return db.Query<Category>(statement).AsList();
    }
    public List<Product> GetAllProductsByCategory(int categoryId)
    {
        string statement = """
                           SELECT p.ProductID,
                                  p.ProductName,
                                  p.[CategoryID],
                                  c.[CategoryID],
                                  c.CategoryName,
                                  c.Description,
                                  s.[SupplierID],
                                  s.CompanyName,
                                  s.City
                           FROM dbo.Products p
                               LEFT JOIN dbo.Categories c
                                   ON p.[CategoryID] = c.[CategoryID]
                               LEFT JOIN dbo.Suppliers s
                                   ON p.SupplierID = s.SupplierID
                           """;

        if (categoryId > -1)
            statement += "  WHERE p.[CategoryId] = @CategoryId";

        statement += "  ORDER BY p.[ProductName]";


        var result = db.Query<Product, Category, Supplier, Product>(statement,
            param: new
            {
                CategoryId = categoryId,

            },
            map: (product, category, supplier) =>
            {
                product.Category = category;
                product.Supplier = supplier;
                return product;
            },
            splitOn: "CategoryId").AsQueryable();

        return result.AsList();
    }

    public List<Product> GetAllProductsBySupplier(int supplierId = 2)
    {
        List<Countries> countries = db.Query<Countries>(
            """
            SELECT [CountryIdentifier],[Name] 
            FROM [dbo].[Countries];
            """)
            .AsList();

        const string statement =
            """
            SELECT dbo.Products.*,
                   dbo.Suppliers.*
            FROM dbo.Products
                JOIN dbo.Suppliers
                    ON Products.SupplierID = Suppliers.SupplierID
                       AND Suppliers.SupplierID = @supplierId;
            """;
        IEnumerable<Product> products = db
            .Query<Product, Supplier, Product>(statement,
                (product, supplier) =>
                {
                    supplier.Country = countries
                        .FirstOrDefault(x => 
                            x.CountryIdentifier == supplier.SupplierId)!.Name;
                    product.Supplier = supplier;
                    return product;
                }, 
                new { supplierId }, 
                splitOn: nameof(Supplier.SupplierId)); 

        return products.AsList();
    }
}