<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function loggedOneUser(Request $request)
    {
        /*
            Estou logando este usuário para mi tratar como usuário logado ao inserir uma venda,
            Paraa você não ter que ficar inserindo Login e senha fiz automático ;)
        */
        if(Auth::check()){
           return redirect('home');
        }else{
            $user = User::find(1);
            if($user){
                $login = Auth::loginUsingId($user->id);
                return redirect('home');
            }else{
                //Se não tem o usuário irei criar, para não ter que rodar comandos etc =D
                $dataUser=[
                    "id" => 1,
                    "name" => "Ronaldo Novaes",
                    "email" => "emporio.rony@gmail.com",
                    "password" => Hash::make("Bem vindo a B2Midia"),
                ];

                $user=User::create($dataUser);

                return redirect('home');
            }
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect('login');
    }
}
