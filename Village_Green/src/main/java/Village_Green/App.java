package Village_Green;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

/**
 * JavaFX App
 */
public class App extends Application {

    // private static DBInfo NUC = new DBInfo("jdbc:mysql://localhost:3306/makingticket", "dev", "dev"); 
    // private static DBInfo LAPTOP = new DBInfo("jdbc:mysql://localhost:3306/makingticket", "root", "root"); 

    private static Scene scene;

    @Override
    public void start(Stage stage) throws IOException {
        // PlaceDAO dao = new PlaceDAO(App.NUC);
        // List<Place> list = dao.getPlaces();
        // Place place = list.get(0);
        // place.setArtist("John Lennon");
        // dao.updatePlace(place);
        // list = dao.getPlaces();
        // list.get(0).printPlace();
        scene = new Scene(loadFXML("produit"), 1080, 620);
        stage.setScene(scene);
        stage.show();
    }

    static void setRoot(String fxml) throws IOException {
        scene.setRoot(loadFXML(fxml));
    }

    private static Parent loadFXML(String fxml) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource(fxml + ".fxml"));
        return fxmlLoader.load();
    }

    public static void main(String[] args) {
        launch();
    }

}