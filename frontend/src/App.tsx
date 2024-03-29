import React from 'react';
import logo from './logo.svg';
import './App.css';
import axios from "axios";
import {BrowserRouter, Navigate, Route, Routes} from "react-router-dom";
import LoginPage from "./pages/Authentication/login";
import Registration from "./pages/Authentication/registration";
import UserDataForm from "./pages/UserDataForm";
import SpacesuitForm from "./pages/SpacesuitForm";
import MatchPage from "./pages/Match";
import GalleryPage from "./pages/Gallery";
import ManagerPage from "./pages/Manager";
import UserProfilePage from "./pages/UserProfile";

const App: React.FC = () => {

  return (
      <BrowserRouter>
          <Routes>
              <Route
                  path="*"
                  element={<Navigate to="/" replace={true} />}
              />
              <Route path="/" element={<LoginPage/>}/>
              <Route path="/register" element={<Registration/>}/>
              <Route path="/form" element={ <UserDataForm/>}/>
              <Route path="/spacesuit-form" element={ <SpacesuitForm/>}/>
              <Route path="/match" element={ <MatchPage/>}/>
              <Route path="/gallery" element={ <GalleryPage/>}/>
              <Route path="/profile" element={ <UserProfilePage/>}/>
              {localStorage.getItem("role") === "manager" ?  <Route path="/requests" element={ <ManagerPage/>}/> : ''}


          </Routes>



      </BrowserRouter>
  );
}

export default App;
