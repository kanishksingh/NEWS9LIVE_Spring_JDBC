/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Beans;

/**
 *
 * @author KANISHK
 */
public class News {
    private int sno;
    private String rName,rDesignation,datePlace,entryDate,folderPath,reporterImageName,reporterImagePath,title,subheading,content,descriptionlimit,
            imagefirstName,aligement,enteredBy,enteredOn,imagefirstpath,imagefirstCaption,videoLink,menuName,publish,status,subMenuName,youtubeVideoLink,tags;
    private int khabarsno,menusno,submenu;

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getYoutubeVideoLink() {
        return youtubeVideoLink;
    }

    public void setYoutubeVideoLink(String youtubeVideoLink) {
        this.youtubeVideoLink = youtubeVideoLink;
    }

    public String getSubMenuName() {
        return subMenuName;
    }

    public void setSubMenuName(String subMenuName) {
        this.subMenuName = subMenuName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getEnteredOn() {
        return enteredOn;
    }

    public void setEnteredOn(String enteredOn) {
        this.enteredOn = enteredOn;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrDesignation() {
        return rDesignation;
    }

    public void setrDesignation(String rDesignation) {
        this.rDesignation = rDesignation;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAligement() {
        return aligement;
    }

    public void setAligement(String aligement) {
        this.aligement = aligement;
    }

    public int getKhabarsno() {
        return khabarsno;
    }

    public void setKhabarsno(int khabarsno) {
        this.khabarsno = khabarsno;
    }

    public int getMenusno() {
        return menusno;
    }

    public void setMenusno(int menusno) {
        this.menusno = menusno;
    }

    public int getSubmenu() {
        return submenu;
    }

    public void setSubmenu(int submenu) {
        this.submenu = submenu;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }

    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }

    public String getDescriptionlimit() {
        return descriptionlimit;
    }

    public void setDescriptionlimit(String descriptionlimit) {
        this.descriptionlimit = descriptionlimit;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }


    public String getDatePlace() {
        return datePlace;
    }

    public void setDatePlace(String datePlace) {
        this.datePlace = datePlace;
    }

    public String getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    public String getFolderPath() {
        return folderPath;
    }

    public void setFolderPath(String folderPath) {
        this.folderPath = folderPath;
    }

    public String getReporterImageName() {
        return reporterImageName;
    }

    public void setReporterImageName(String reporterImageName) {
        this.reporterImageName = reporterImageName;
    }

    public String getReporterImagePath() {
        return reporterImagePath;
    }

    public void setReporterImagePath(String reporterImagePath) {
        this.reporterImagePath = reporterImagePath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubheading() {
        return subheading;
    }

    public void setSubheading(String subheading) {
        this.subheading = subheading;
    }

   

    public String getImagefirstName() {
        return imagefirstName;
    }

    public void setImagefirstName(String imagefirstName) {
        this.imagefirstName = imagefirstName;
    }

    public String getImagefirstpath() {
        return imagefirstpath;
    }

    public void setImagefirstpath(String imagefirstpath) {
        this.imagefirstpath = imagefirstpath;
    }


    public String getImagefirstCaption() {
        return imagefirstCaption;
    }

    public void setImagefirstCaption(String imagefirstCaption) {
        this.imagefirstCaption = imagefirstCaption;
    }



}
