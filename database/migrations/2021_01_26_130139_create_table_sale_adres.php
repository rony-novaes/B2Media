<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableSaleAdres extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sale_adres', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('sale_id');
            $table->string('zip_code',50);
            $table->string('street',255);
            $table->string('number',10);
            $table->string('city',50);
            $table->string('state',50);
            $table->string('ibge',50);
            $table->string('gia',50);
            $table->string('ddd',5);
            $table->string('siafi',50);
            $table->string('district',100);
            $table->string('complement',255);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sale_adres');
    }
}
