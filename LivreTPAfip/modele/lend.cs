namespace LivreTPAfip.modele
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("lend")]
    public partial class lend
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int idCopy { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int idPeople { get; set; }

        [Key]
        [Column(Order = 2)]
        public DateTime dateStart { get; set; }

        public DateTime? dateEnd { get; set; }

        public virtual copy copy { get; set; }

        public virtual people people { get; set; }
    }
}
