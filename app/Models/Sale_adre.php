<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale_adre extends Model
{
    use HasFactory;
    protected $fillable=[
        'sale_id','zip_code','street','number','city','state','district',
    ];
}
