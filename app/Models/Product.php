<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'category_id', 'supplier_id', 'product_name','product_code','root','image','buying_price','selling_price','buying_date','product_quantity'
    ];
}
