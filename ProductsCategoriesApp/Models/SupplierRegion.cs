﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProductsCategoriesApp.Models;

public partial class SupplierRegion
{
    [Key]
    public int RegionId { get; set; }

    public string RegionDescription { get; set; }

    [InverseProperty("RegionNavigation")]
    public virtual ICollection<Suppliers> Suppliers { get; } = new List<Suppliers>();
}