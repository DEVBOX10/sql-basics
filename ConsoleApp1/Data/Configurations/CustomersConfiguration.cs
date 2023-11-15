﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using ConsoleApp1.Data;
using ConsoleApp1.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;

namespace ConsoleApp1.Data.Configurations
{
    public partial class CustomersConfiguration : IEntityTypeConfiguration<Customers>
    {
        public void Configure(EntityTypeBuilder<Customers> entity)
        {
            entity.HasKey(e => e.CustomerIdentifier).HasName("PK_Customers_1");

            entity.HasIndex(e => e.City, "City");

            entity.HasIndex(e => e.CompanyName, "CompanyName");

            entity.HasIndex(e => e.ContactId, "IX_Customers_ContactId");

            entity.HasIndex(e => e.ContactTypeIdentifier, "IX_Customers_ContactTypeIdentifier");

            entity.HasIndex(e => e.CountryIdentifier, "IX_Customers_CountryIdentifier");

            entity.HasIndex(e => e.PostalCode, "PostalCode");

            entity.HasIndex(e => e.Region, "Region");

            entity.Property(e => e.CustomerIdentifier).HasComment("Primary key");
            entity.Property(e => e.City).HasMaxLength(15);
            entity.Property(e => e.CompanyName)
            .IsRequired()
            .HasMaxLength(40);
            entity.Property(e => e.Fax).HasMaxLength(24);
            entity.Property(e => e.ModifiedDate).HasDefaultValueSql("(getdate())");
            entity.Property(e => e.Phone).HasMaxLength(24);
            entity.Property(e => e.PostalCode).HasMaxLength(10);
            entity.Property(e => e.Region).HasMaxLength(15);
            entity.Property(e => e.Street).HasMaxLength(60);

            entity.HasOne(d => d.Contact).WithMany(p => p.Customers)
            .HasForeignKey(d => d.ContactId)
            .HasConstraintName("FK_Customers_Contacts");

            entity.HasOne(d => d.ContactTypeIdentifierNavigation).WithMany(p => p.Customers)
            .HasForeignKey(d => d.ContactTypeIdentifier)
            .HasConstraintName("FK_Customers_ContactType");

            entity.HasOne(d => d.CountryIdentifierNavigation).WithMany(p => p.Customers)
            .HasForeignKey(d => d.CountryIdentifier)
            .HasConstraintName("FK_Customers_Countries");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Customers> entity);
    }
}
