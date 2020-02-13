package Village_Green;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * ClientDAO
 */
public class ProduitDAO {

    private Connection con;

    public ProduitDAO(DBInfo dbInfo){
        try {
            this.con = DriverManager.getConnection(dbInfo.url, dbInfo.username, dbInfo.password);
        } catch (SQLException e) {
            this.printError(e);
        }
    }

    // Destructeur
    protected void finalize() throws SQLException {
        this.con.close();
    }

    public boolean insertProduit(Produit toto) {
        try {
            // requête préparée
            PreparedStatement stm = this.con.prepareStatement("INSERT INTO produit (`pro_ref`, `pro_libelle`, `pro_description`, `pro_achat`, `pro_vente`, `pro_stock`, `cat_id`) VALUES (?, ?, ?, ?, ?, ?, 0);");
            stm.setString(1, toto.getPro_ref());
            stm.setString(2, toto.getPro_libelle());
            stm.setString(3, toto.getPro_description());
            stm.setInt(4, toto.getPro_achat());
            stm.setInt(5, toto.getPro_vente());
            stm.setInt(6, toto.getPro_stock());

            stm.execute();
            stm.close();
            return true;
        } catch (SQLException e) {
            this.printError(e);
            return false;
        }
    }

    public List<Produit> getProduits() {
        try {
            // Création du tableau à renvoyer
            ArrayList<Produit> out = new ArrayList<Produit>();
            
            // Récupère les données de la base de donnée
            PreparedStatement stm = this.con.prepareStatement("SELECT * FROM produit;");
            ResultSet result = stm.executeQuery();
            
            // Rempli les tableau à renvoyer
            while (result.next()){
                out.add(this.makeProduit(result));
            }

            return out;
        } catch (SQLException e) {
            this.printError(e);
            return new ArrayList<Produit>();
        }
    }

    public boolean updateProduit(Produit produit) {
        try {
            PreparedStatement stm = this.con.prepareStatement("UPDATE produit SET pro_ref=?, pro_libelle=?, pro_description=?, pro_achat=?, pro_vente=?, pro_stock=? WHERE pro_id=?");
            stm.setString(1, produit.getPro_ref());
            stm.setString(2, produit.getPro_libelle());
            stm.setString(3, produit.getPro_description());
            stm.setInt(4, produit.getPro_achat());
            stm.setInt(5, produit.getPro_vente());
            stm.setInt(6, produit.getPro_stock());
            stm.setInt(7, produit.getPro_id());
            stm.execute();
            stm.close();
            return true;
        } catch (SQLException e) {
            this.printError(e);
            return false;
        }
    }

    public Produit updateProduitObject(Produit produit) {
        Produit outProduit;
        try {
            PreparedStatement stm = this.con.prepareStatement("SELECT * FROM produit WHERE `pro_ref`=? LIMIT 1;");
            stm.setString(1, produit.getPro_ref());
            ResultSet result = stm.executeQuery();
            result.next();
            outProduit = this.makeProduit(result);
        } catch (SQLException e) {
            this.printError(e);
            outProduit = new Produit();
        }
        return outProduit;
    }

    public boolean deleteProduit(Produit produit) {
        return this.deleteProduit(produit.getPro_id());
    }

    public boolean deleteProduit(int id) {
        try {
            PreparedStatement stm = this.con.prepareStatement("DELETE FROM produit WHERE pro_id=?");
            stm.setInt(1, id);
            stm.execute();
            stm.close();
            return true;
        } catch (Exception e) {
            this.printError(e);
            return false;
        }
    }

    private Produit makeProduit(ResultSet result){
        try {
            Produit produit = new Produit();
            produit.setPro_id(result.getInt(1));
            produit.setPro_ref(result.getString(2));
            produit.setPro_libelle(result.getString(3));
            produit.setPro_description(result.getString(4));
            produit.setPro_achat(result.getInt(5));
            produit.setPro_vente(result.getInt(6));
            produit.setPro_stock(result.getInt(7));
            return produit;
        } catch (Exception e) {
            this.printError(e);
            return new Produit();
        }
    }

    private void printError(Exception e) {
        System.err.println(String.format("Error: %s", e.getMessage()));
    }
}
