let priceTotal = 0;
var token = document.querySelector('meta[name="csrf-token"]').content;
function newproduct(i)
{
    var form =$("#product-form-"+i);
    $.ajax({
        url: 'http://localhost/B2-Media/public/sale/product',
        type: "post",
        data: form.serialize(),
        dataType: 'json',
        success: function (response) {
            $('#inputSaleCep').removeClass('is-invalid')
            if(response.success){
                var supplier = '';
                for(i=0;i<response.cartProduct.suppliers.length;i+=1){
                    supplier+=response.cartProduct.suppliers[i].name;
                }
                var form = `<form class="formSale">
                                <input type="hidden" name="saleId" value="`+response.cartProduct.id+`">
                            </form>`;
                console.log(form)
                var data = `<tr><th scope="row">`+response.cartProduct.name+`</th><td>R$ `+response.cartProduct.price+`</td>
                            <td>`+supplier+`</td>
                            </tr>`;

                priceTotal+=parseFloat(response.cartProduct.price);
                var totalF = priceTotal;
                var total = totalF.toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
                console.log(total)
                $('#priceTotal').empty().append(total);
                $('#TableCar').append(data);
                $('#TableCarForm').append(form);
            }
        }
    });
}
function searchCep(cep)
{
    if(cep.length==8){
        $.ajax({
            url: 'https://viacep.com.br/ws/'+cep+'/json/',
            type: "get",
            dataType: 'json',
            success: function (response) {
                console.log(response)
                $('#dataAdress').removeClass('d-none')
                $('#inputSaleAdress').val(response.logradouro);
                $('#inputSaleCity').val(response.localidade);
                $('#inputSaleUf').val(response.uf);
                $('#inputSaleDistrict').val(response.bairro);

                //Bairro, Cep, localidade, logradouro, uf
            }
        });
    }
    return;

}

function createSale()
{
    var error=null;
    var adress = $('#inputSaleAdress').val();
    if(adress == ""){
        error=true;
    }
    var number = $('#inputSaleNumber').val();
    if(number == ""){
        error=true;
    }
    var city = $('#inputSaleCity').val();
    if(city == ""){
        error=true;
    }
    var uf = $('#inputSaleUf').val();
    if(uf == ""){
        error=true;
    }
    var district= $('#inputSaleDistrict').val();
    if(district == ""){
        error=true;
    }
    var zip= $('#inputSaleCep').val();
    if(zip == ""){
        error=true;
    }
    if(error){
        $('#inputSaleCep').addClass('is-invalid')
        return;
    }
    var adre = {"adress":adress,"number":number,"city":city,"uf":uf,"district":district,"zip":zip,}
    var sales=[];
    var form = document.querySelectorAll('.formSale');
    var countProd = null;
    form.forEach(e => {
        var countProd=true;
        sales.push(e.saleId.value);
    })
    if(priceTotal<1){
        alert('Você precisa adicionar produtos')
        return;
    }
    $.ajax({
        url: 'http://localhost/B2-Media/public/sale',
        type: "post",
        data:{"_token":token,"sales":sales,"adress":adre},
        dataType: 'json',
        success: function (response) {
           alert("Venda realizada com sucesso!");
            var adress = $('#inputSaleAdress').val('');
            var number = $('#inputSaleNumber').val('');
            var city = $('#inputSaleCity').val('');
            var uf = $('#inputSaleUf').val('');
            var district= $('#inputSaleDistrict').val('');
            var zip= $('#inputSaleCep').val('');
            let priceTotal = 0;
            $('#priceTotal').empty().append('R$ 0,00');
            $('#TableCar').empty();
            $('#TableCarForm').empty();


        }
    });

}

function search(v)
{
    $.ajax({
        url: 'http://localhost/B2-Media/public/search',
        type: "post",
        data:{"_token":token,"ref":v},
        dataType: 'json',
        success: function (response) {
            console.log(response)
            $('#cardProducts').empty();
            var countC=0;
            response.data.forEach(e => {
                var cnt = ++countC;
                var suplier = '';
                e.suppliers.forEach(e=> {
                    suplier=suplier+e.supplie.name+ ', ';
                });
                var data = `<div class="card col-md-3 p-0 mx-2 my-2">
                        <img src="http://localhost/B2-Media/public/images/bg/`+cnt+`.jpg" class="card-img-top" alt="...">
                        <div class="card-body pt-2">
                            <h5 class="card-title mb-0">`+e.name+`</h5>
                            <small class="text-muted">Ref: `+e.reference+`</small>
                            <h5 class="card-title text-success mb-2">R$ `+e.price.toLocaleString('pt-br',{style: 'currency', currency: 'BRL'})+`</h5>
                            <p class="card-text"><b>Fornecedores:</b><br>`+suplier+`</p>
                            <a href="#" class="btn btn-success col"
                               onclick="event.preventDefault();newproduct(`+cnt+`);">
                               Comprar
                            </a>
                            <form id="product-form-`+cnt+`" action="http://localhost/B2-Media/public/product" method="POST" class="d-none">
                                <input type="hidden" name="productId" value="`+e.id+`">
                                <input type="text" name="_token" value="`+token+`">
                            </form>
                        </div>
                    </div>`;
                $('#cardProducts').append(data);
            });

        }
    });
}
