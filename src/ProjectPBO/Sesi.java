/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProjectPBO;


public class Sesi {
    public static String id = "0";
    public static String level = "0";
    public static String idtransaksi;
    public static String pegawaiid;
    public static String namabarang = null;
    
    public static String get_id(){
        return id;
    }
    
    public static void set_id(String username){
        Sesi.id = username;
    }
    public static void set_pegawai_id(String id){
        Sesi.pegawaiid = id;
    }
    public static String get_pegawai_id(){
        return pegawaiid;
    }
    public static String get_Level(){
        return level;
    }
    
    public static void set_Level(String level){
        Sesi.level = level;
    }
    
    public static String get_idtransaksi(){
        return idtransaksi;
    }
    
    public static void set_idtransaksi(String idtransaksi){
        Sesi.idtransaksi = idtransaksi;
    }
    
    public static void set_namabarang(String namabarang){
        Sesi.namabarang = namabarang;
    }
    
    public static String get_namabarang(){
        return namabarang;
    }
    
}
