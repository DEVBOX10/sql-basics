﻿using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace DapperSimpleApp.Classes
{
    public static class DataGridViewExtensions
    {
        public static void ExpandColumns(this DataGridView source, bool sizable = true)
        {
            foreach (DataGridViewColumn col in source.Columns)
            {
                if (col.ValueType.Name != "ICollection`1")
                {
                    col.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                }
            }

            if (!sizable) return;

            for (int index = 0; index <= source.Columns.Count - 1; index++)
            {
                int columnWidth = source.Columns[index].Width;

                source.Columns[index].AutoSizeMode = DataGridViewAutoSizeColumnMode.None;
                source.Columns[index].Width = columnWidth;
            }


        }
        public static void ExpandColumns1(this DataGridView sender)
        {
            foreach (DataGridViewColumn col in sender.Columns)
            {
                // ensure we are not attempting to do this on an Entity
                if (col.ValueType != null && col.ValueType.Name != "ICollection`1")
                {
                    if (col.Name != "BirthDate")
                    {
                        col.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    }
                }
            }
        }
        public static void FixHeaders(this DataGridView source)
        {
            for (int index = 0; index < source.Columns.Count; index++)
            {
                source.Columns[index].HeaderText = source.Columns[index].HeaderText.SplitOnCapitalLetters();
            }
        }
    }
}
