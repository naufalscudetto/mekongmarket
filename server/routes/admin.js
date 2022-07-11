const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const {product} = require('../models/product');

//Add Fish
adminRouter.post('/admin/add-product', admin, async (req, res) => {
    try{
        const {name, description, images, quantity, price, category} = req.body;
        let Product = new product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        Product = await Product.save();
        res.json(Product);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});

// Get 
adminRouter.get('/admin/get-products', admin, async (req, res) => {
    try {
        const products = await product.find({});
        res.json(products);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});

// Delete
adminRouter.post('/admin/delete-product', admin, async (req, res) => {
    try {
      const { id } = req.body;
      let Product = await product.findByIdAndDelete(id);
      res.json(Product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

module.exports = adminRouter;