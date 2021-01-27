<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use App\Models\Sale;
use App\Models\Sale_adre;
use App\Models\sale_product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SalesController extends Controller
{
    public function sale(Request $request)
    {
        $sales=Sale::create([
            'user_id'=>Auth::id(),
        ]);
        $adress=Sale_adre::create([
            'sale_id'=>$sales->id,
            'zip_code'=>$request->adress['zip'],
            'street'=>$request->adress['adress'],
            'number'=>$request->adress['number'],
            'city'=>$request->adress['city'],
            'state'=>$request->adress['uf'],
            'district'=>$request->adress['district']
        ]);
        foreach ($request->sales as $sale){
            $product=Product::find($sale);
            $sale_product=sale_product::create([
                'product_id'=>$product->id,
                'sale_id'=>$sales->id,
                'price'=>$product->price,
            ]);
        }
        $response['success']=true;
        echo json_encode($response);
        return;
    }
    public function product(Request $request)
    {
        $product = Product::find($request->productId);
        $response['success']=true;

        $suppliers=[];
        foreach ($product->suppliers as $supplier){
            $suppliers[]=[
                'name'=>$supplier->supplie->name,
            ];
        }

        $response['cartProduct']=[
            'id'=>$product->id,
            'name'=>$product->name,
            'reference'=>$product->reference,
            'price'=>$product->price,
            'suppliers'=>$suppliers
        ];
        echo json_encode($response);
        return;

    }
}
