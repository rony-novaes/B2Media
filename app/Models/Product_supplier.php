<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product_supplier extends Model
{
    use HasFactory;
    public function supplie()
    {
        return $this->hasOne(Supplier::class,'id','supplier_id');
    }
}
