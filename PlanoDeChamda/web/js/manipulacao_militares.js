/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function identidade_do_registro(idt,nome){
    document.getElementById('identidade').value = idt;
    document.getElementById('nome').value = nome;
}

function test(idt,nome){
    alert(idt + " " + nome);
}

function efeito(id){
    alert(id);
}