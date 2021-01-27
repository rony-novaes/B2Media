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
    alert(zip);
    var adre = {"adress":adress,"number":number,"city":city,"uf":uf,"district":district,"zip":zip,}
    var sales=[];
    var form = document.querySelectorAll('.formSale');
    form.forEach(e => {
        sales.push(e.saleId.value);
    })
    $.ajax({
        url: 'http://localhost/B2-Media/public/sale',
        type: "post",
        data:{"_token":token,"sales":sales,"adress":adre},
        dataType: 'json',
        success: function (response) {
           alert("Venda realizada com sucesso!")
        }
    });

}
