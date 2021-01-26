@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h6 class="text-muted">Produtos</h6>
                    @foreach($data['products'] as $key=>$product)
                    <div class="card col-md-3 p-0">
                        <img src="http://localhost/B2-Media/public/images/bg/{{++$key}}.jpg" class="card-img-top" alt="...">
                        <div class="card-body pt-2">
                            <h5 class="card-title mb-0">{{$product->name}}</h5>
                            <small class="text-muted">Ref: {{$product->reference}}</small>
                            <h5 class="card-title text-success mb-2">R$ 39,90{{--$product->price()--}}</h5>
                            @if($product->suppliers->count()>0)
                            <p class="card-text"><b>Fornecedores:</b><br>
                                @foreach($product->suppliers as $key=>$supplie)
                                    @if($key>0)
                                        ,
                                    @endif
                                    {{$supplie->supplie->name}}
                                @endforeach
                            </p>
                            @endif
                            <a href="#" class="btn btn-success col">Comprar</a>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h6 class="text-muted">Meus Produtos</h6>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Nome</th>
                            <th scope="col">Preço</th>
                            <th scope="col">Fornecedores</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">Product 1</th>
                            <td>R$ 12,90</td>
                            <td>Forn 1</td>
                        </tr>
                        <tr>
                            <th scope="row">Product 1</th>
                            <td>R$ 12,90</td>
                            <td>Forn 1</td>
                        </tr>
                        <tr>
                            <th scope="row">Product 1</th>
                            <td>R$ 12,90</td>
                            <td>Forn 1, Forn 2</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="col-12 mt-4 p-0">
                        <input type="number" class="form-control" placeholder="Insire seu Cep"/>
                    </div>
                    <button type="button" class="btn btn-outline-success w-100 mt-4">Finalizar Pedido</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
