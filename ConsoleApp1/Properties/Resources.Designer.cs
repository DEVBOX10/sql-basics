﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleApp1.Properties {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "17.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("ConsoleApp1.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to SELECT o.OrderID,
        ///       o.CustomerIdentifier,
        ///       o.EmployeeID,
        ///       o.OrderDate,
        ///       o.ShippedDate,
        ///       o.DeliveredDate,
        ///       o.ShipVia,
        ///       o.Freight, 
        ///	   s.CompanyName AS Shipper,
        ///	   e.FirstName + &apos; &apos; + e.LastName AS FullName
        ///FROM dbo.Orders AS o
        ///INNER JOIN dbo.Shippers AS s
        ///        ON o.ShipVia = s.ShipperID
        ///    INNER JOIN dbo.Employees AS e
        ///        ON o.EmployeeID = e.EmployeeID
        ///ORDER BY o.OrderID 
        ///OFFSET @OffSet1 ROWS FETCH NEXT @PageSize1 ROW ONLY;.
        /// </summary>
        internal static string OrdersPaginationSelectStatementBroken {
            get {
                return ResourceManager.GetString("OrdersPaginationSelectStatementBroken", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to SELECT o.OrderID,
        ///       o.CustomerIdentifier,
        ///       o.EmployeeID,
        ///       o.OrderDate,
        ///       o.ShippedDate,
        ///       o.DeliveredDate,
        ///       o.ShipVia,
        ///       o.Freight, 
        ///	   s.CompanyName AS Shipper,
        ///	   e.FirstName + &apos; &apos; + e.LastName AS FullName
        ///FROM dbo.Orders AS o
        ///INNER JOIN dbo.Shippers AS s
        ///        ON o.ShipVia = s.ShipperID
        ///    INNER JOIN dbo.Employees AS e
        ///        ON o.EmployeeID = e.EmployeeID
        ///ORDER BY o.OrderID 
        ///OFFSET @OffSet ROWS FETCH NEXT @PageSize ROW ONLY;.
        /// </summary>
        internal static string OrdersPaginationSelectStatementGood {
            get {
                return ResourceManager.GetString("OrdersPaginationSelectStatementGood", resourceCulture);
            }
        }
    }
}
