package service;

import bean.Product;
import repository.ProductRepository;
import repository.ProductRepositoryImpl;

import java.util.List;

public class ProductService implements ProductServiceImpl{

    ProductRepositoryImpl productRepository=new ProductRepository();

    @Override
    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        this.productRepository.save(product);
    }

    @Override
    public Product findById(int id) {
        return this.productRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        this.productRepository.update(id,product);
    }

    @Override
    public void remove(int id) {
        this.productRepository.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
}
