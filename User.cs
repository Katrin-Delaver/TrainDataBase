//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TrainDataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public int tabNum { get; set; }
        public string password { get; set; }
        public string FIO { get; set; }
    
        public virtual Driver Driver { get; set; }
    }
}
