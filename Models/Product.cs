using System.ComponentModel.DataAnnotations;
public class Product {
    public int Id { get; set; }
    [Required]
    public string? Description { get; set; }
    [Required]
    public int Amount { get; set; }
    [Required]
    public decimal Price { get; set; }
    [Required]
    public string? Status { get; set; }

    
}