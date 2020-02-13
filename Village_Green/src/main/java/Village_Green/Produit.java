package Village_Green;

/**
 * Place
 */
public class Produit {

    private Integer pro_id;
    private int pro_achat;
    private String pro_ref;
    private int pro_stock;
    private int pro_vente;
    private String pro_description;
    private String pro_libelle;

    public Produit() {
        super();
    }

    public Produit(int pro_achat, String pro_ref, int pro_stock, int pro_vente, String pro_description, String pro_libelle){
        this.setPro_achat(pro_achat);
        this.setPro_ref(pro_ref);
        this.setPro_stock(pro_stock);
        this.setPro_vente(pro_vente);
        this.setPro_description(pro_description);
        this.setPro_libelle(pro_libelle);
    }

    public String getPro_libelle() {
        return pro_libelle;
    }

    public void setPro_libelle(String pro_libelle) {
        this.pro_libelle = pro_libelle;
    }

    public Integer getPro_id() {
        return pro_id;
    }

    public void setPro_id(Integer pro_id) {
        this.pro_id = pro_id;
    }

    public int getPro_achat() {
        return pro_achat;
    }

    public void setPro_achat(int pro_achat) {
        this.pro_achat = pro_achat;
    }

    public String getPro_ref() {
        return pro_ref;
    }

    public void setPro_ref(String pro_ref) {
        this.pro_ref = pro_ref;
    }

    public int getPro_stock() {
        return pro_stock;
    }

    public void setPro_stock(int pro_stock) {
        this.pro_stock = pro_stock;
    }

    public int getPro_vente() {
        return pro_vente;
    }

    public void setPro_vente(int pro_vente) {
        this.pro_vente = pro_vente;
    }

    public String getPro_description() {
        return pro_description;
    }

    public void setPro_description(String pro_description) {
        this.pro_description = pro_description;
    }



    public void printProduit(){
        System.out.println(String.format("id: %d\npro_achat: %d\npro_ref: %s\npro_stock: %d\npro_description: %s\npro_libelle: %s",
            this.pro_id,
            this.pro_achat,
            this.pro_ref,
            this.pro_stock,
            this.pro_description,
                this.pro_libelle
        ));
    }

    public boolean equals(Produit produitToTest) {
        return (this.pro_ref.equals(produitToTest.pro_ref) && this.pro_libelle.equals(produitToTest.pro_libelle) && this.pro_achat == produitToTest.pro_achat && this.pro_id == produitToTest.pro_id && this.pro_description.equals(produitToTest.pro_description) && this.pro_stock == produitToTest.pro_stock);
    }

    public boolean isEmpty() {
        return this.equals(new Produit());
    }
}