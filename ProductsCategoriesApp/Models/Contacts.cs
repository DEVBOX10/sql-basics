﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProductsCategoriesApp.Models;

[Index("ContactTypeIdentifier", Name = "IX_Contacts_ContactTypeIdentifier")]
public partial class Contacts
{
    [Key]
    public int ContactId { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    public int? ContactTypeIdentifier { get; set; }

    [InverseProperty("Contact")]
    public virtual ICollection<ContactDevices> ContactDevices { get; } = new List<ContactDevices>();

    [ForeignKey("ContactTypeIdentifier")]
    [InverseProperty("Contacts")]
    public virtual ContactType ContactTypeIdentifierNavigation { get; set; }

    [InverseProperty("Contact")]
    public virtual ICollection<Customers> Customers { get; } = new List<Customers>();
}