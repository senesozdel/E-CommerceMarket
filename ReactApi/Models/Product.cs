﻿namespace ReactApi.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string ?Name { get; set; }
        public string ?Description { get; set; }

        public double ?OldPrice { get; set; }
        public double ?NewPrice { get; set; }

        public int CategoryId { get; set; }

        public Category ?Category { get; set; }

        public string ?Image {  get; set; }

        public List<OrderProduct> ?OrderProducts { get; set; }

    }
}
