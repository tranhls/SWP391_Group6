package entity;

public class User {

    private int employeeID;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String accountID;

    public User() {
    }

    public User(int employeeID, String name, String email, String phone, String address, String accountID) {
        this.employeeID = employeeID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.accountID = accountID;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String position) {
        this.address = position;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

}
