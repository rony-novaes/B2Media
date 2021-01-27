<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class sale_product extends Model
{
    use HasFactory;
    protected $fillable = ['product_id','sale_id','price',];
}
