@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="p-3">
                    <input class="form-control" onkeyup="search(this.value)" placeholder="Pesquisar"/>
                </div>
                <div class="card-body row" id="cardProducts">
                    @foreach($data['products'] as $key=>$product)
                    <div class="card col-md-3 p-0 mx-2 my-2">
                        <img src="http://localhost/B2-Media/public/images/bg/{{++$key}}.jpg" class="card-img-top" alt="...">
                        <div class="card-body pt-2">
                            <h5 class="card-title mb-0">{{$product->name}}</h5>
                            <small class="text-muted">Ref: {{$product->reference}}</small>
                            <h5 class="card-title text-success mb-2">R$ {{$product->price}}</h5>
                            @if($product->suppliers->count()>0)
                            <p class="card-text"><b>Fornecedores:</b><br>
                                @foreach($product->suppliers as $key=>$supplie)
                                    @if($key>0), @endif
                                    {{$supplie->supplie->name}}
                                @endforeach
                            </p>
                            @endif
                            <a href="#" class="btn btn-success col"
                               onclick="event.preventDefault();newproduct({{$key}});">
                               Comprar
                            </a>

                            <form id="product-form-{{$key}}" action="{{asset('newproduct')}}" method="POST" class="d-none">
                                @csrf
                                <input type="hidden" name="productId" value="{{$product->id}}">
                            </form>
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
                        <tbody id="TableCar"></tbody>
                    </table>
                    <div class="d-none" id="TableCarForm"></div>
                    <div class="col text-right">
                        <h5>
                            <span id="priceTotal">R$ 0,00</span>
                        </h5>
                    </div>
                    <div class="col-12 mt-4 p-0">
                        <input type="number" class="form-control" id="inputSaleCep" onkeyup="searchCep(this.value)" placeholder="Insire seu Cep"/>
                    </div>
                    <div class="col-12 mt-4 p-0 d-none row m-0" id="dataAdress">
                        <div class="col-9 p-1">
                            <input type="text" class="form-control" id="inputSaleAdress" name="adress"  placeholder="Rua"/>
                        </div>
                        <div class="col-3 p-1">
                            <input type="text" class="form-control" id="inputSaleNumber" name="number"  placeholder="Nº"/>
                        </div>
                        <div class="col-12 p-1">
                            <input type="text" class="form-control" id="inputSaleDistrict" name="district"  placeholder="Bairro"/>
                        </div>
                        <div class="col-8 p-1">
                            <input type="text" class="form-control" id="inputSaleCity" name="city"  placeholder="Cidade"/>
                        </div>
                        <div class="col-4 p-1">
                            <input type="text" class="form-control" id="inputSaleUf" name="uf"  placeholder="UF"/>
                        </div>
                    </div>
                    <button type="button" class="btn btn-outline-success w-100 mt-4" onclick="createSale()">Finalizar Pedido</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
