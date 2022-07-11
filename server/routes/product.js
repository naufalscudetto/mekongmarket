const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const {product} = require('../models/product');


productRouter.get('/api/products', auth, async (req, res) => {
    try {
        console.log(req.query.category)
        const products = await product.find({category: req.query.category});
        res.json(products);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
    try {
      const products = await product.find({
        name: { $regex: req.params.name, $options: "i" },
      });
  
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  productRouter.post("/api/rate-product", auth, async (req, res) => {
    try {
      const { id, rating } = req.body;
      let Product = await product.findById(id);
  
      for (let i = 0; i < Product.ratings.length; i++) {
        if (Product.ratings[i].userId == req.user) {
        Product.ratings.splice(i, 1);
          break;
        }
      }
  
      const ratingSchema = {
        userId: req.user,
        rating,
      };
  
      Product.ratings.push(ratingSchema);
      Product = await Product.save();
      res.json(product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  productRouter.get("/api/deal-of-day", auth, async (req, res) => {
    try {
      let products = await product.find({});
  
      products = products.sort((a, b) => {
        let aSum = 0;
        let bSum = 0;
  
        for (let i = 0; i < a.ratings.length; i++) {
          aSum += a.ratings[i].rating;
        }
  
        for (let i = 0; i < b.ratings.length; i++) {
          bSum += b.ratings[i].rating;
        }
        return aSum < bSum ? 1 : -1;
      });
  
      res.json(products[0]);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

module.exports = productRouter;