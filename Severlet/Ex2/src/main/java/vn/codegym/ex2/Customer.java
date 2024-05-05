package vn.codegym.ex2;

import java.util.Date;

public class Customer {

    private String name;
    private String dob;
    private String address;
    private String imageURL;

    public Customer(String name, String dob, String address, String imageURL) {
        this.name = name;
        this.dob = dob;
        this.address = address;
        this.imageURL = imageURL;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "name='" + name + '\'' +
                ", dob=" + dob +
                ", address='" + address + '\'' +
                ", imageURL='" + imageURL + '\'' +
                '}';
    }
}
