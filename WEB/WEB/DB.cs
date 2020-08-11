using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Npgsql;

namespace WEB
{
    public class DB
    {
        static NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=Odev; User Id=postgres; Password=kursat123;");


        public static void dataekle(string eposta, string kullaniciadi, string sifre,string adi)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into kullanici (adi,eposta,kullaniciadi,sifre) values ('"+adi+"','" + eposta + "','" + kullaniciadi + "','" + sifre + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static bool giriskontrol(string id, string pass)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM kullanici where kullaniciadi='" + id + "' and sifre='" + pass + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            DataSet dataSet = new DataSet();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.Fill(dataSet);
            connection.Close();

            bool sonuc = false;

            if (dataSet.Tables[0].Rows.Count > 0)
                sonuc = true;
            else
                sonuc = false;
            return sonuc;
        }
        public static bool yoneticikontrol(string id, string pass)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM yonetici where yoneticiid='" + id + "' and sifre='" + pass + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            DataSet dataSet = new DataSet();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.Fill(dataSet);
            connection.Close();

            bool sonuc = false;

            if (dataSet.Tables[0].Rows.Count > 0)
                sonuc = true;
            else
                sonuc = false;
            return sonuc;
        }
        public static bool hakkindakontrol(int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM kullanicihakkinda where id='" + id + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            DataSet dataSet = new DataSet();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.Fill(dataSet);
            connection.Close();

            bool sonuc = false;

            if (dataSet.Tables[0].Rows.Count > 0)
                sonuc = true;
            else
                sonuc = false;
            return sonuc;
        }
        public static DataSet hakkindacek(int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM kullanicihakkinda where id='" + id + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();


            return dataSet;
        }
        public static DataSet adcek(int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT adi FROM kullanici where id='" + id + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();


            return dataSet;
        }
        public static bool kullaniciadikontrol(string kullaniciadi)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT* FROM kullanici where kullaniciadi ='" + kullaniciadi + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            DataSet dataSet = new DataSet();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.Fill(dataSet);
            connection.Close();
            bool sonuc = false;

            if (dataSet.Tables[0].Rows.Count > 0)
                sonuc = true;
            else
                sonuc = false;
            return sonuc;
        }
        public static void profilekle(int id, string adi, string egitim, string sehir, string dt, string cinsiyet)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into kullanicihakkinda (id,adi,egitim,sehir,dogumtarihi,cinsiyet) values ('" + id + "','" + adi + "','" + egitim + "','" + sehir + "','" + dt + "','" + cinsiyet + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);

            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void kullaniciadiguncelle(string kullaniciadi, string kadi)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "UPDATE kullanici SET kullaniciadi='" + kullaniciadi + "' where kullaniciadi='" + kadi + "' ";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void sifreguncelle(string sifre, string kadi)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "UPDATE kullanici SET sifre = '" + sifre + "' where kullaniciadi='" + kadi + "' ";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void epostaguncelle(string eposta, string kadi)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "UPDATE kullanici SET eposta='" + eposta + "' where kullaniciadi='" + kadi + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void profilguncelle(string adi, string egitim, string sehir, string dt, string cinsiyet, int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "UPDATE kullanicihakkinda SET adi ='" + adi + "', egitim ='" + egitim + "', sehir ='" + sehir + "', dogumtarihi ='" + dt + "', cinsiyet ='" + cinsiyet + "' WHERE id='" + id + "' ";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static int idcek(string kadi)
        {
            int sonuc = 0;
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM kullanici where kullaniciadi='" + kadi + "'";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);

            NpgsqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                sonuc = Convert.ToInt32(reader[0]);
            }
            connection.Close();
            return sonuc;
        }
        public static void KullaniciSil(int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            
            string sql2 = "DELETE FROM kullanicihakkinda  WHERE id='" + id + "'";
            
            
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, connection);
            
            
            cmd2.ExecuteNonQuery();

            connection.Close();

        }
        public static DataSet hakkindacek()
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM kullanicihakkinda ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet kayitcek()
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kullanici.id,kullanicihakkinda.adi,kullanici.eposta,kullanici.kullaniciadi from kullanici inner join kullanicihakkinda on kullanicihakkinda.id=kullanici.id ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet kisikayitcek(string kullaniciadi)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM kullanici where kullaniciadi='" + kullaniciadi + "' ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void KategoriEkle(string text)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into kategori (kategori)values('" + text + "')";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);


            cmd.ExecuteNonQuery();

            connection.Close();

        }
        public static void YonetmenEkle(string text)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into yonetmen(yonetmen)values('" + text + "')";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);


            cmd.ExecuteNonQuery();

            connection.Close();

        }
        public static void SenaristEkle(string text)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into senarist (senarist)values('" + text + "')";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);


            cmd.ExecuteNonQuery();

            connection.Close();

        }
        public static void DilEkle(string text)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into dil(dil)values('" + text + "')";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);


            cmd.ExecuteNonQuery();

            connection.Close();

        }
        public static void OdulEkle(string text)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into odul(odul)values('" + text + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void ArkadasEkle(int arkadas,int kullanici)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into Arkadaslik(arkadasid,kullaniciid)values('"+arkadas+"','"+kullanici+"')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void ArkadasSil(int kullanici,int arkadas)
        {
            try { connection.Open(); } catch (Exception e) { }

            string sql2 = "DELETE FROM arkadaslik  WHERE kullaniciid='" + kullanici + "' and arkadasid='"+arkadas+"'";


            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, connection);


            cmd2.ExecuteNonQuery();

            connection.Close();

        }
        public static bool Arkadaskontrol(int arkadas, int kullanici)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM Arkadaslik where arkadasid='" +arkadas+ "' and kullaniciid='" +kullanici+ "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            DataSet dataSet = new DataSet();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.Fill(dataSet);
            connection.Close();

            bool sonuc = false;

            if (dataSet.Tables[0].Rows.Count > 0)
                sonuc = true;
            else
                sonuc = false;
            return sonuc;
        }
        public static DataSet kategoriCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kategori from kategori";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet YonetmenCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select yonetmen from yonetmen";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet SenaristCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select senarist from senarist";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet DilCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select dil from dil";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet OdulCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select odul from odul";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void FilmEkle(string adi, int y, int s, int k, int o, int d, int dakika)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Insert into film(filmadi,yonetmenid,senaristid,kategoriid,dilid,odulid,filmdakikasi)values('" + adi + "','" + y + "','" + s + "','" + k + "','" + d + "','" + o + "','" + dakika + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static void FilmDuzenle(string adiW,string adi, int y, int s, int k, int o, int d, int dakika)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "UPDATE public.film SET filmadi ='"+adi+"', yonetmenid ='"+y+"', senaristid ='"+s+"', kategoriid ='"+k+"', odulid ='"+o+"', dilid ='"+d+"', filmdakikasi ='"+dakika+"' WHERE filmadi='"+adiW+"' ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static DataSet Odulid(string o)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select odulid from odul where odul='" + o + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet yonid(string y)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select yonetmenid from yonetmen where yonetmen='" + y + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet senid(string s)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select senaristid from senarist where senarist='" + s + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet katid(string k)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kategoriid from kategori where kategori='" + k + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet dilid(string d)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select dilid from dil where dil='" + d + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet FilmCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select film.filmid,film.filmadi,yonetmen.yonetmen,senarist.senarist,kategori.kategori,dil.dil,odul.odul from film " +
                "Inner Join yonetmen on film.yonetmenid = yonetmen.yonetmenid " +
                "Inner Join senarist on film.senaristid = senarist.senaristid " +
                "Inner Join kategori on film.kategoriid = kategori.kategoriid " +
                "Inner Join dil on film.dilid = dil.dilid " +
                "Inner Join odul on film.odulid = odul.odulid";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void FilmSil(int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Delete from film where filmid='" + id + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static DataSet FilmisimCek()
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select film.filmadi from film";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet ismegorefilm(string adi)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select film.filmid,film.filmadi,yonetmen.yonetmen,senarist.senarist,kategori.kategori,dil.dil,odul.odul,film.filmdakikasi from film " +
                "Inner Join yonetmen on film.yonetmenid = yonetmen.yonetmenid " +
                "Inner Join senarist on film.senaristid = senarist.senaristid " +
                "Inner Join kategori on film.kategoriid = kategori.kategoriid " +
                "Inner Join dil on film.dilid = dil.dilid " +
                "Inner Join odul on film.odulid = odul.odulid where filmadi='"+adi+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet KisiAra(string kisi)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select adi from kullanicihakkinda where adi like '%"+kisi+"%'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet ArkadasCek(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "select kullanicihakkinda.adi,arkadaslik.arkadasid from arkadaslik inner join kullanicihakkinda on kullanicihakkinda.id=arkadaslik.arkadasid where kullaniciid='"+id+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet Kullanciadi(string kisi)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select id from kullanicihakkinda where adi ='"+kisi+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet ismegorefilmara(string adi)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select film.filmid,film.filmadi,yonetmen.yonetmen,senarist.senarist,kategori.kategori,dil.dil,odul.odul,film.filmdakikasi from film " +
                "Inner Join yonetmen on film.yonetmenid = yonetmen.yonetmenid " +
                "Inner Join senarist on film.senaristid = senarist.senaristid " +
                "Inner Join kategori on film.kategoriid = kategori.kategoriid " +
                "Inner Join dil on film.dilid = dil.dilid " +
                "Inner Join odul on film.odulid = odul.odulid where filmadi LIKE  '%"+adi+"%'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void ArkadasaFilmOner(int kid,int aid,int fid)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "insert into filmoneri (kullaniciid,arkadasid,filmid)values('"+kid+"','"+aid+"','"+fid+"')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void Filmizleme(int kid,int fid)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "insert into izlenme (kullaniciid,filmid)values('" + kid + "','" + fid + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static bool izlenmekontrol(int kid, int fid)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "SELECT * FROM izlenme where kullaniciid='" + kid + "' and filmid='" + fid + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            DataSet dataSet = new DataSet();
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.Fill(dataSet);
            connection.Close();

            bool sonuc = false;

            if (dataSet.Tables[0].Rows.Count > 0)
                sonuc = true;
            else
                sonuc = false;
            return sonuc;
        }
        public static DataSet İzlenmeSayısı(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select count(filmid) from izlenme where filmid='"+id+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet ismegoreid(string adi)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select id from kullanicihakkinda where adi='"+adi+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet ArkadasOnerileri(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kullanicihakkinda.adi,film.filmadi from filmoneri inner join film on film.filmid=filmoneri.filmid inner join kullanicihakkinda on kullanicihakkinda.id = filmoneri.kullaniciid where filmoneri.arkadasid = '"+id+"'"; 
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void Mesaj(int kid, int aid,string mesaj)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "insert into mesaj (gonderenid,aliciid,mesaj)values('" + kid + "','" + aid + "','" + mesaj + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static DataSet Mesajlarım(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kullanicihakkinda.adi , mesaj.mesaj from mesaj inner join kullanicihakkinda on kullanicihakkinda.id = mesaj.gonderenid where mesaj.aliciid='"+id+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void alıntı(int kid, int fid, string alınıt)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "insert into alıntı (kullaniciid,filmid,alıntı)values('" + kid + "','" + fid + "','" +alınıt + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static void Inceleme(int kid, int fid, string inceleme)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "insert into inceleme (kullaniciid,filmid,inceleme)values('" + kid + "','" + fid + "','" + inceleme + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static DataSet AlıntıCek(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kullanicihakkinda.adi,film.filmadi,alıntı.alıntı from alıntı inner join kullanicihakkinda on kullanicihakkinda.id=alıntı.kullaniciid inner join film on film.filmid = alıntı.filmid where film.filmid = '"+id+"'";
                NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet incelemeCek(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kullanicihakkinda.adi,film.filmadi,inceleme.inceleme from inceleme inner join kullanicihakkinda on kullanicihakkinda.id=inceleme.kullaniciid inner join film on film.filmid = inceleme.filmid where film.filmid = '" + id + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static void PuanVer(int kid, int fid, int puan)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "insert into puanlama (kullaniciid,filmid,puan)values('" + kid + "','" + fid + "','" + puan + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        public static DataSet puanCek(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select kullanicihakkinda.adi,film.filmadi,puanlama.puan from puanlama inner join kullanicihakkinda on kullanicihakkinda.id=puanlama.kullaniciid inner join film on film.filmid = puanlama.filmid where film.filmid = '" + id + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
        public static DataSet ortalamapuan(int id)
        {
            DataSet dataSet = new DataSet();
            try { connection.Open(); } catch (Exception e) { }
            string sql = "Select AVG(puan)::numeric(10,2) from puanlama where filmid='"+id+"'";
                NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(sql, connection);
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }
    }
}