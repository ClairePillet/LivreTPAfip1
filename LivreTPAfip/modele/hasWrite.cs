namespace LivreTPAfip.modele
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("hasWrite")]
    public partial class hasWrite
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int idbook { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int idwriter { get; set; }

        public DateTime? Realese { get; set; }

        public virtual book book { get; set; }

        public virtual writer writer { get; set; }
    }
}
