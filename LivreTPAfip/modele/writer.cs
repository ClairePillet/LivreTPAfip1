namespace LivreTPAfip.modele
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("writer")]
    public partial class writer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public writer()
        {
            hasWrite = new HashSet<hasWrite>();
        }

        public int id { get; set; }

        public string name { get; set; }

        public string firstName { get; set; }

        public DateTime? birthday { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<hasWrite> hasWrite { get; set; }
    }
}
