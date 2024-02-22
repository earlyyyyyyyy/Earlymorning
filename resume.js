import React, { useState } from 'react';
import { SafeAreaView, ScrollView, View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native';

const App = () => {
  const [currentSection, setCurrentSection] = useState('name');

  const resumeData = {
    imageUrl: require('./myimage.jpg'),
    name: 'Earl Vincent Maratas',
    course: 'Bachelor of Science in Information Technology',
    education: {
      elementary: 'luis Francisco Elementary School',
      elementaryYear: '2015',
      highSchool: 'dalandanan national highschool',
      highSchoolYear: '2019',
      seniorHighSchool:'our lady of Fatima',
     seniorHighSchool:Year:2021

      college: 'Global Reciprocal Colleges ',
      collegeYear: '2025',
    },

    about: ``,
   
   
    projects:
      {
        projectName: 'Jarvy',
        imageSrc: 'https://www.miyens.com/wp-content/uploads/2024/02/jarvy-300x300.png',
        link: 'https://jarvy.ai',
        description: 'Meet Jarvy, your AI sidekick to help you generate AI content like scripts, images, voiceover, code, transcript and more.',
      },

      projects1:
      {
        projectName1: 'Juander',
        imageSrc1: 'https://www.miyens.com/wp-content/uploads/2022/05/juander-by-miyens-300x300.png',
        link1: 'https://juander.net',
        description1: 'Juander is an eLearning authoring tool, LMS, and mobile app in one that lets you convert traditional training materials to digital format and deliver effective online lessons.',
      },

    contact: {
      mobile: '099-153-27742', // Replace with your actual mobile phone number
      email: 'maratasearlvincent@gmail.com', // Replace with your actual email address
    },
  };

const handlePress = () => {
  setCurrentSection((prevSection) => {
    switch (prevSection) {
      case 'name':
        return 'education';
      case 'education':
        return 'about';
      case 'about':
        return 'projects'; // Move to the 'projects' section
      case 'projects':
        return 'projects1'; // Move to 'projects1'
             case 'projects1':
          return 'contact'; // Move to the 'contact' section
        case 'contact':
          return 'name'; // Loop back to the start
        default:
          return 'name';
    }
  });
};

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <ScrollView contentContainerStyle={styles.container}>
        <TouchableOpacity onPress={handlePress} style={styles.contentContainer}>
          {currentSection === 'name' && (
            <>
              <Image source={resumeData.imageUrl} style={styles.image} />
              <View style={styles.textContainer}>
                <Text style={styles.header}>{resumeData.name}</Text>
                <Text style={styles.info}>{resumeData.course}</Text>
              </View>
            </>
          )}

          {currentSection === 'education' && (
            <View style={styles.textContainer}>
              <Text style={styles.header1}>Education:</Text>
              <Text style={styles.projectTitle}>
                {'\n'}College:
                {'\n'}
                  </Text>
                <Text style={styles.info1}>{resumeData.education.college}</Text>
                {' | '}
                {resumeData.education.collegeYear}
           
              <Text style={styles.projectTitle}>
                {'\n'}High School:
                {'\n'}
                  </Text>
                <Text style={styles.info1}>{resumeData.education.highSchool}</Text>
                {' | '}
                {resumeData.education.highSchoolYear}
     
              <Text style={styles.projectTitle}>
                {'\n'}Elementary:
                {'\n'}
                  </Text>
                <Text style={styles.info1}>{resumeData.education.elementary}</Text>
                {' | '}
                {resumeData.education.elementaryYear}
           
            </View>
          )}

          {currentSection === 'about' && (
            <View style={styles.textContainer}>
              <Text style={styles.header1}>About me:{'\n'}</Text>
              <Text style={styles.about}>{resumeData.about}</Text>
            </View>
          )}

{currentSection === 'projects' && (
  <View style={styles.projectsContainer}>
    <Text style={styles.header1}>Projects:</Text>
    <Text style={styles.projectTitle}>{resumeData.projects.projectName}</Text>
    <Image source={{ uri: resumeData.projects.imageSrc }} style={styles.projectImage} />
    <Text style={styles.projectLink}>{resumeData.projects.link}</Text>
    <Text style={styles.projectDescription}> {resumeData.projects.description}</Text>
  </View>
)}

{currentSection === 'projects1' && (
  <View style={styles.projectsContainer}>
     <Text style={styles.header1}>Projects:</Text>
    <Text style={styles.projectTitle}>{resumeData.projects1.projectName1}</Text>
    <Image source={{ uri: resumeData.projects1.imageSrc1 }} style={styles.projectImage} />
    <Text style={styles.projectLink}>{resumeData.projects1.
