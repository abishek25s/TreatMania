package servlets;
// Restaurant.java
public class Restaurant {
    private int id;
    private String name;
    private String cuisineType;
    private String imageUrl;

    // Constructors, getters, and setters
    public Restaurant() {
    }

    public Restaurant(int id, String name, String cuisineType, String imageUrl) {
        this.id = id;
        this.name = name;
        this.cuisineType = cuisineType;
        this.imageUrl = imageUrl;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
