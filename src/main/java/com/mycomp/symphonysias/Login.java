/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias;

import com.mycomp.symphonysias.auth.UsuarioDAO;
import com.mycomp.symphonysias.model.Usuario;

public class Login {
    public Usuario autenticar(String usuario, String clave) {
        UsuarioDAO dao = new UsuarioDAO();
        return dao.validar(usuario, clave); // Este metodo debe aplicar hash y mapear rol
    
    }
}
