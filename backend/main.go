package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID string `json:"id"`
	TaskName string `json:"task_name"`
	TaskDetail string `json:"task_detail"`
	Date string `json:"date"`
}

var tasks []Tasks

func allTasks() {
	task := Tasks {
		ID: "1",
		TaskName: "New projects",
		TaskDetail: "You must lead the project and finish it",
		Date: "2024-08-17",
	}

	tasks = append(tasks, task)
	
	task1 := Tasks {
		ID: "2",
		TaskName: "Power project",
		TaskDetail: "This need to be done on an urgent basis",
		Date: "2024-08-20",
	}

	tasks = append(tasks, task1)
	fmt.Println("Your tasks are: ", task, task1)
}

func homePage(w http.ResponseWriter, r* http.Request) {
	
}

func getTasks(w http.ResponseWriter, r* http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}

func getTask(w http.ResponseWriter, r* http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	found := false

	for _, currentTask := range tasks {
		if currentTask.ID == params["id"] {
			json.NewEncoder(w).Encode(currentTask)
			found = true
			break
		}
	}

	if !found {
		json.NewEncoder(w).Encode(map[string]string{"status": "Error"})
	}
}

func createTask(w http.ResponseWriter, r* http.Request) {

}

func deleteTask(w http.ResponseWriter, r* http.Request) {

}

func updateTask(w http.ResponseWriter, r* http.Request) {

}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/tasks", getTasks).Methods("GET")
	router.HandleFunc("/task/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	fmt.Println("Serving at port 8082")
	log.Fatal(http.ListenAndServe(":8082", router))
}

func main() {
	allTasks()
	handleRoutes()
}