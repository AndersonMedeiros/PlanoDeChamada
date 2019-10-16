/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    var atual_fs, prox_fs, voltar_fs;
    
    $('.prox').click(function(){
        atual_fs = $(this).parent();
        prox_fs = $(this).parent().next();
        
        $('#progresso li').eq($('fieldset').index(prox_fs)).addClass('ativo');
        atual_fs.hide(800);
        prox_fs.show(800);
    });
    
    $('.voltar').click(function(){
        atual_fs = $(this).parent();
        voltar_fs = $(this).parent().prev();
        
        $('#progresso li').eq($('fieldset').index(atual_fs)).removeClass('ativo');
        atual_fs.hide(800);
        voltar_fs.show(800);
    });
    
    $('#formulario button[type=submit]').click(function(){
        return false;
    });
});