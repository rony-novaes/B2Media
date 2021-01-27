<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $data=[
            'products'=>Product::all(),
        ];
        return view('home',compact('data'));
    }
    public function searchProduct(Request $request)
    {
        $data=Product::where('name', 'like', '%'.$request->ref.'%')
            ->orWhere('reference', 'like', '%'.$request->ref.'%')
            ->get();
        foreach ($data as $product){
            foreach ($product->suppliers as $supplier){
                $suppliers[]=[
                    'name'=>$supplier->supplie->name,
                ];
            }
            $products[]=[
                'id'=>$product->id,
                'name'=>$product->name,
                'reference'=>$product->reference,
                'price'=>$product->price,
                'suppliers'=>$suppliers
            ];
        }
        $response['success']=true;
        $response['data']=$data;
        echo json_encode($response);
        return;
    }
}
