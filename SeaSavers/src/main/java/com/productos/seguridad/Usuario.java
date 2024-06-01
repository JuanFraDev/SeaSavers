package com.productos.seguridad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.*;

public class Usuario {

	private int id;
	private int perfil;
	private int genero;
	private int edad;
	private String nombre;
	private String correo;	//importante
	private String clave;	//importante

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public int getPerfil() 
	{
		return perfil;
	}

	public void setPerfil(int perfil) 
	{
		this.perfil = perfil;
	}

	public int getGenero() 
	{
		return genero;
	}

	public void setGenero(int genero) 
	{
		this.genero = genero;
	}

	public int getEdad()
	{
		return edad;
	}
	
	public void setEdad(int edad)
	{
		this.edad = edad;
	}
	
	public String getNombre() 
	{
		return nombre;
	}

	public void setNombre(String nombre) 
	{
		this.nombre = nombre;
	}

	public String getCorreo() 
	{
		return correo;
	}

	public void setCorreo(String correo) 
	{
		this.correo = correo;
	}

	public String getClave() 
	{
		return clave;
	}

	public void setClave(String clave) 
	{
		this.clave = clave;
	}

	public String ingresarCliente()
	{
		String result="";

		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_us, nombre_us, edad_us, correo_us,"
				+ "clave_us, id_per, id_gen) "
				+ "VALUES(?,?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,this.getId());
			pr.setString(2,this.getNombre());
			pr.setInt(3, this.getEdad());
			pr.setString(4, this.getCorreo());
			pr.setString(5, this.getClave());
			pr.setInt(6, 2);
			pr.setInt(7, this.getGenero());
			if(pr.executeUpdate()==1)
			{
				result="Insercion correcta";
			}
			else
			{
				result="Error en insercion";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
			System.out.print(result);
		}
		finally
		{
			try
			{
				pr.close();
				con.getConexion().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result; 
	}


	//modificar este método
	public String getUsuarios()
	{
		String sql="SELECT COUNT(*) FROM tb_usuario";
		ResultSet rs=null;
		Conexion con=new Conexion();
		String usuarios="";
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				usuarios=String.valueOf(rs.getInt(1));
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return usuarios;
	}

	public boolean verificarUsuario(String nlogin, String nclave)
	{
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where correo_us='"+nlogin+
				"' and clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				respuesta=true;
				this.setCorreo(rs.getString(4));
				this.setClave(rs.getString(5));
				this.setPerfil(rs.getInt(6));
				this.setNombre(rs.getString(2));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public String getUserbyId(String id)
	{
		String sql="SELECT nombre_us FROM tb_usuario WHERE id_us="+id;
		ResultSet rs=null;
		Conexion con=new Conexion();
		String usuario="";
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				usuario=String.valueOf(rs.getString(1));
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return usuario;	}
}


