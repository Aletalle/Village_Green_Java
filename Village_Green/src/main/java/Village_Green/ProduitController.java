package Village_Green;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;


public class ProduitController {

    private class NumberInput {
        public TextField textField;
        public Label errorLabel;
        public String errorMessage;

        public NumberInput(TextField textField, Label errorLabel, String errorMessage) {
            this.textField = textField;
            this.errorLabel = errorLabel;
            this.errorMessage = errorMessage;
        }

        public void setOnError() {
            this.textField.setStyle("-fx-border-color: red");
            this.errorLabel.setText(this.errorMessage);
            this.errorLabel.setDisable(false);
        }

        public void setOnOk() {
            this.textField.setStyle("");
            this.errorLabel.setText("");
            this.errorLabel.setDisable(true);
        }
    }


    public Label txt_id;
    public TextField txt_ref;
    public TextField txt_libelle;
    public TextField txt_description;
    public TextField txt_achat;
    public TextField txt_vente;
    public TextField txt_stock;
    public TableColumn<Produit, String> tab_ref;
    public TableColumn<Produit, String> tab_libelle;
    public TableColumn<Produit, String> tab_description;
    public TableColumn<Produit, String> tab_achat;
    public TableColumn<Produit, String> tab_vente;
    public TableColumn<Produit, String> tab_stock;
    public Button btn_add;
    public Button btn_edit;
    public Button btn_delete;
    public Button btn_clean;
    public TableView<Produit> liste_produit;
    public Label red_stock;
    public Label red_vente;
    public Label red_achat;

    private NumberInput achat;
    private NumberInput vente;
    private NumberInput stock;



    ObservableList<Produit> model = FXCollections.observableArrayList();
    ProduitDAO dao;
    private static DBInfo LAPTOP = new DBInfo("jdbc:mysql://localhost:3306/village_green?serverTimezone=UTC", "root", "");



    // ==== Groupe d'initialisation
    public void initialize(){
        this.liste_produit.setEditable(false);
        this.initCol(this.tab_ref, "pro_ref");
        this.initCol(this.tab_libelle, "pro_libelle");
        this.initCol(this.tab_description, "pro_description");
        this.initCol(this.tab_achat, "pro_achat");
        this.initCol(this.tab_vente, "pro_vente");
        this.initCol(this.tab_stock, "pro_stock");

        achat = new NumberInput(this.txt_achat, this.red_achat, "Le prix d'achat doit être un nombre entier");
        vente = new NumberInput(this.txt_vente, this.red_vente, "Le prix de vente doit être un nombre entier");
        stock = new NumberInput(this.txt_stock, this.red_stock, "Le stock doit être un nombre entier");

        this.setModel(this.model);
        this.dao = new ProduitDAO(ProduitController.LAPTOP);

        this.fillModel();
    }

    private void initCol(TableColumn<Produit, ?> col, String attribute) {
        col.setCellValueFactory(new PropertyValueFactory<>(attribute));
    }


// ==== Model

    protected ObservableList<Produit> fillModel() {
        this.setModel(FXCollections.observableArrayList(this.dao.getProduits()));
        return this.model;
    }

    protected void updateProduitInModel(Produit produitToUpdate) {
        produitToUpdate.printProduit();
        for(int i=0; i<this.model.size(); i++) {
            Produit produit = this.model.get(i);
            if (produit.getPro_id() == produitToUpdate.getPro_id()){
                this.model.set(i, produitToUpdate);
                this.dao.updateProduit(produitToUpdate);
            }
        }
    }

    protected Produit addProduitInModel(Produit produitToAdd) {
        if (!this.isProduitInModel(produitToAdd)){
            if(this.dao.insertProduit(produitToAdd)) {
                produitToAdd = this.dao.updateProduitObject(produitToAdd);
                this.model.add(produitToAdd);
                return produitToAdd;
            }
        }
        return new Produit();
    }

    protected void deleteProduitInModel(Produit produitToDelete) {
        for (Produit produit : this.model) {
            if (produit.equals(produitToDelete)) {
                this.model.remove(produit);
                this.dao.deleteProduit(produit);
            }
        }
    }

    protected boolean isProduitInModel(Produit produitToTest) {
        for (Produit produit : this.model) {
            if (produit.equals(produitToTest)){
                return true;
            }
        }
        return false;
    }

    private Produit getSelectedProduit() {
        return this.model.get(
                this.liste_produit
                        .getSelectionModel()
                        .getSelectedIndex()
        );
    }


// ===== Listeners

    public void btn_add_action(ActionEvent actionEvent) {
        this.resetNumberInputError();
        try {
            Produit data = this.makeProduitFromTextField();
            data = this.addProduitInModel(data);
            if (!data.isEmpty()) {
                this.fillTextField(data);
            }
        } catch (ProAchatNumberFormatException e) {
           this.achat.setOnError();
        } catch (ProStockNumberFormatException e) {
            this.stock.setOnError();
        } catch (ProVenteNumberFormatException e) {
            this.vente.setOnError();
        }
    }

    public void btn_edit_action(ActionEvent actionEvent) {
        this.resetNumberInputError();
        try {
            // Récupérer la donnée
            Produit data = this.makeProduitFromTextField();
            // La modifier dans le model
            this.updateProduitInModel(data);
        } catch (ProAchatNumberFormatException e) {
            this.achat.setOnError();
        }catch (ProStockNumberFormatException e) {
            this.stock.setOnError();
        }catch (ProVenteNumberFormatException e){
            this.vente.setOnError();
        }
    }

    public void btn_delete_action(ActionEvent actionEvent) {
        this.deleteProduitInModel(this.getSelectedProduit());
    }

    public void btn_clean_action(ActionEvent actionEvent) {
        this.clearTextField();
    }

     public void tab_on_click(MouseEvent mouseEvent) {
        if (this.isDoubleClick(mouseEvent)){
            this.fillTextField(this.getSelectedProduit());
        }
    }

    private boolean isDoubleClick (MouseEvent mouseEvent) {
        if(mouseEvent.getButton().equals(MouseButton.PRIMARY)) {
            if (mouseEvent.getClickCount() == 2) {
                return true ;
            }
        }
        return false ;
    }

// ====== TextField Management


    protected Produit makeProduitFromTextField() throws NumberFormatException{
        int i =0;
        Produit out = new Produit();
        out.setPro_ref(this.txt_ref.getText());

        out.setPro_libelle(this.txt_libelle.getText());
        out.setPro_description(this.txt_description.getText());
        try {
            out.setPro_achat(Integer.parseInt(this.txt_achat.getText()));
        } catch (NumberFormatException e) {
            throw new ProAchatNumberFormatException();
        }
        try {
            out.setPro_vente(Integer.parseInt(this.txt_vente.getText()));
        } catch (NumberFormatException e) {
            throw new ProVenteNumberFormatException();
        }
        try {
            out.setPro_stock(Integer.parseInt(this.txt_stock.getText()));
        } catch (NumberFormatException e) {
            throw new ProStockNumberFormatException();
        }

        if (!this.txt_id.getText().equals("")) {
            out.setPro_id(Integer.parseInt(this.txt_id.getText()));
        }

        return out;
    }

    protected void clearTextField() {
        this.txt_ref.clear();
        this.txt_libelle.clear();
        this.txt_description.clear();
        this.txt_achat.clear();
        this.txt_vente.clear();
        this.txt_stock.clear();
        this.txt_id.setText("");
        this.resetNumberInputError();
    }

    protected void fillTextField(Produit produit) {
        this.clearTextField();
        this.txt_ref.setText(produit.getPro_ref());
        this.txt_libelle.setText(produit.getPro_libelle());
        this.txt_description.setText(produit.getPro_description());
        this.txt_achat.setText(Integer.toString(produit.getPro_achat()));
        this.txt_vente.setText(Integer.toString(produit.getPro_vente()));
        this.txt_stock.setText(Integer.toString(produit.getPro_stock()));
        this.txt_id.setText(Integer.toString(produit.getPro_id()));
    }

    protected void resetNumberInputError() {
        this.vente.setOnOk();
        this.stock.setOnOk();
        this.achat.setOnOk();
    }



// ===== Getters and setters

    public void setModel(ObservableList<Produit> model) {
        this.model = model;
        this.liste_produit.setItems(model);
    }
}
