package com.berka.springbootlibrarymanagement.rest;

import com.berka.springbootlibrarymanagement.entity.Book;
import com.berka.springbootlibrarymanagement.entity.User;
import com.berka.springbootlibrarymanagement.exception.UserNotFoundException;
import com.berka.springbootlibrarymanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;

@RestController
@RequestMapping("/api")
public class UserRestController {

    private UserService userService;


    @Autowired
    public UserRestController(UserService userService) {
        this.userService = userService;
    }

    // все юзеры
    @GetMapping("/users")
    public List<User> findAll() {

        return userService.findAll();
    }

    @GetMapping("/users/{userId}")
    public User getUser(@PathVariable int userId) {

        User user = userService.findById(userId);

        if (user == null) {
            throw new UserNotFoundException("User id not found " + userId);

        }

        return user;

    }

    @PostMapping("/users")
    public User addUser(@RequestBody User theUser) {

        theUser.setId(0);

        userService.save(theUser);

        return theUser;

    }


    @PutMapping("/users")
    public User updateUser(@RequestBody User user) {

        userService.save(user);
        return user;

    }

    @DeleteMapping("/users/{userId}")
    public String deleteUser(@PathVariable int userId) {
        User user = userService.findById(userId);

        if (user == null) {
            throw new UserNotFoundException("User id not found " + userId);
        }

        userService.deleteById(userId);

        return "Deleted user id + " + userId;
    }

    // получить все книги юзера по ИД

    @GetMapping("/users/{userId}/books")
    public ResponseEntity<List<Book>> getAllBooksByUserId(
            @PathVariable int userId) {


        if (userService.findById(userId) == null) { //если нет юзера с таким ИД
            throw new UserNotFoundException("User id : " + userId + " not found.");

        }

        List<Book> books = userService.findBooksByUserId(userId);

        return new ResponseEntity<>(books, HttpStatus.OK);
    }

    // удалить книгу юзера
    @DeleteMapping("/users/{userId}/{bookId}")
    public String  deleteBookForUser(@PathVariable int userId,
                                                  @PathVariable int bookId) {

        if (userService.findById(userId) == null) {
            throw new UserNotFoundException("User id : " + userId + " not found.");
        }

        // получить все книги юзера
        List<Book> books = userService.findBooksByUserId(userId);

        // удалить книгу

        userService.deleteBookForUser(books, bookId);

        // сохранить юзера
        userService.save(userService.findById(userId));

        return "Deleted Book Id : " + bookId;
    }

}
