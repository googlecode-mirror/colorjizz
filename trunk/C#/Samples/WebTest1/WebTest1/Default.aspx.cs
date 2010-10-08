﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ColorJizz;

namespace WebTest1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            color.Text = new Hex(0xFFD200).toCMYK().toXYZ().toHex().toRGB().ToString();
        }
    }
}