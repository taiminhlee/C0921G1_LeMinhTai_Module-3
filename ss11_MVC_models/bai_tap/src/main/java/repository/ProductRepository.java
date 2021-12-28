package repository;

import bean.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepository implements ProductRepositoryImpl{
   static Map<Integer, Product> productMap;

   static {
       productMap=new TreeMap<>();
       productMap.put(1,new Product(1,"iPhone", 1000.0,"slim","Apple"));
       productMap.put(2,new Product(2,"Samsung", 4500.0,"slim","Samsung"));
       productMap.put(3,new Product(3,"Nokia", 200.0,"slim","Nokia"));
   }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
       List<Product> productList=new ArrayList<>();
       String nameProduct;
       name=name.toLowerCase();
        for (Product product:productMap.values()) {
            nameProduct=product.getName().toLowerCase();
           if (nameProduct.contains(name)){

               productList.add(product);
           }
        }
        return productList;
    }
}
