﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SqlLiteSample2.Data;
using SqlLiteSample2.Models;
using System;
using System.Collections.Generic;

namespace SqlLiteSample2.Data.Configurations
{
    public partial class ShippersConfiguration : IEntityTypeConfiguration<Shippers>
    {
        public void Configure(EntityTypeBuilder<Shippers> entity)
        {
            entity.HasKey(e => e.ShipperID);

            entity.Property(e => e.ShipperID).ValueGeneratedNever();
            entity.Property(e => e.CompanyName)
            .IsRequired()
            .UseCollation("NOCASE")
            .HasColumnType("nvarchar(40)");
            entity.Property(e => e.Phone)
            .UseCollation("NOCASE")
            .HasColumnType("nvarchar(24)");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Shippers> entity);
    }
}