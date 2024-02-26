// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

import ModalController from "./modal_controller"
application.register("modal", ModalController)
