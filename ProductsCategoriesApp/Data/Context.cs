﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using ProductsCategoriesApp.Models;

namespace ProductsCategoriesApp.Data;

public partial class Context : DbContext
{
    public Context()
    {
    }

    public Context(DbContextOptions<Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Categories> Categories { get; set; }

    public virtual DbSet<ContactDevices> ContactDevices { get; set; }

    public virtual DbSet<ContactType> ContactType { get; set; }

    public virtual DbSet<Contacts> Contacts { get; set; }

    public virtual DbSet<Countries> Countries { get; set; }

    public virtual DbSet<Customers> Customers { get; set; }

    public virtual DbSet<Employees> Employees { get; set; }

    public virtual DbSet<OrderDetails> OrderDetails { get; set; }

    public virtual DbSet<Orders> Orders { get; set; }

    public virtual DbSet<PhoneType> PhoneType { get; set; }

    public virtual DbSet<Products> Products { get; set; }

    public virtual DbSet<Region> Region { get; set; }

    public virtual DbSet<Shippers> Shippers { get; set; }

    public virtual DbSet<SupplierRegion> SupplierRegion { get; set; }

    public virtual DbSet<Suppliers> Suppliers { get; set; }

    public virtual DbSet<Territories> Territories { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=NorthWind;Integrated Security=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ContactDevices>(entity =>
        {
            entity.HasOne(d => d.Contact).WithMany(p => p.ContactDevices).HasConstraintName("FK_ContactDevices_Contacts1");

            entity.HasOne(d => d.PhoneTypeIdentifierNavigation).WithMany(p => p.ContactDevices).HasConstraintName("FK_ContactDevices_PhoneType");
        });

        modelBuilder.Entity<Contacts>(entity =>
        {
            entity.HasOne(d => d.ContactTypeIdentifierNavigation).WithMany(p => p.Contacts).HasConstraintName("FK_Contacts_ContactType");
        });

        modelBuilder.Entity<Customers>(entity =>
        {
            entity.HasKey(e => e.CustomerIdentifier).HasName("PK_Customers_1");

            entity.Property(e => e.CompanyName).HasComment("Company");
            entity.Property(e => e.ModifiedDate).HasDefaultValueSql("(getdate())");

            entity.HasOne(d => d.Contact).WithMany(p => p.Customers).HasConstraintName("FK_Customers_Contacts");

            entity.HasOne(d => d.ContactTypeIdentifierNavigation).WithMany(p => p.Customers).HasConstraintName("FK_Customers_ContactType");

            entity.HasOne(d => d.CountryIdentifierNavigation).WithMany(p => p.Customers).HasConstraintName("FK_Customers_Countries");
        });

        modelBuilder.Entity<Employees>(entity =>
        {
            entity.HasOne(d => d.ContactTypeIdentifierNavigation).WithMany(p => p.Employees).HasConstraintName("FK_Employees_ContactType");

            entity.HasOne(d => d.CountryIdentifierNavigation).WithMany(p => p.Employees).HasConstraintName("FK_Employees_Countries");

            entity.HasMany(d => d.Territory).WithMany(p => p.Employee)
                .UsingEntity<Dictionary<string, object>>(
                    "EmployeeTerritories",
                    r => r.HasOne<Territories>().WithMany()
                        .HasForeignKey("TerritoryID")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_EmployeeTerritories_Territories"),
                    l => l.HasOne<Employees>().WithMany()
                        .HasForeignKey("EmployeeID")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_EmployeeTerritories_Employees"),
                    j =>
                    {
                        j.HasKey("EmployeeID", "TerritoryID").IsClustered(false);
                        j.HasIndex(new[] { "TerritoryID" }, "IX_EmployeeTerritories_TerritoryID");
                        j.IndexerProperty<string>("TerritoryID").HasMaxLength(20);
                    });
        });

        modelBuilder.Entity<OrderDetails>(entity =>
        {
            entity.HasKey(e => new { e.OrderID, e.ProductID }).HasName("PK_Order_Details");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderDetails).HasConstraintName("FK_Order_Details_Orders");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderDetails)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Order_Details_Products");
        });

        modelBuilder.Entity<Orders>(entity =>
        {
            entity.HasOne(d => d.CustomerIdentifierNavigation).WithMany(p => p.Orders)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_Orders_Customers2");

            entity.HasOne(d => d.Employee).WithMany(p => p.Orders).HasConstraintName("FK_Orders_Employees");

            entity.HasOne(d => d.ShipViaNavigation).WithMany(p => p.Orders).HasConstraintName("FK_Orders_Shippers");
        });

        modelBuilder.Entity<Products>(entity =>
        {
            entity.HasOne(d => d.Category).WithMany(p => p.Products).HasConstraintName("FK_Products_Categories");

            entity.HasOne(d => d.Supplier).WithMany(p => p.Products).HasConstraintName("FK_Products_Suppliers");
        });

        modelBuilder.Entity<Region>(entity =>
        {
            entity.HasKey(e => e.RegionID).IsClustered(false);

            entity.Property(e => e.RegionID).ValueGeneratedNever();
            entity.Property(e => e.RegionDescription).IsFixedLength();
        });

        modelBuilder.Entity<Shippers>(entity =>
        {
            entity.Property(e => e.ShipperID).ValueGeneratedNever();
        });

        modelBuilder.Entity<Suppliers>(entity =>
        {
            entity.HasOne(d => d.CountryIdentifierNavigation).WithMany(p => p.Suppliers).HasConstraintName("FK_Suppliers_Countries");

            entity.HasOne(d => d.RegionNavigation).WithMany(p => p.Suppliers)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Suppliers_SupplierRegion1");
        });

        modelBuilder.Entity<Territories>(entity =>
        {
            entity.HasKey(e => e.TerritoryID).IsClustered(false);

            entity.Property(e => e.TerritoryDescription).IsFixedLength();

            entity.HasOne(d => d.Region).WithMany(p => p.Territories)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Territories_Region");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}