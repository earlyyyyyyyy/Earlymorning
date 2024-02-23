import React, { useState } from 'react';
import { SafeAreaView, ScrollView, View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native';

const App = () => {
  const [currentSection, setCurrentSection] = useState('name');

  const resumeData = {
    imageUrl: require('./earl.jpg'),
    name: 'Earl Vincent Maratas',
    course: 'Bachelor of Science in Information Technology',
    education: {
      elementary: 'luis Francisco Elementary School',
      elementaryYear: '2015',
      highSchool: 'dalandanan national highschool',
      highSchoolYear: '2019',
      seniorHighSchool:'our lady of Fatima',
     seniorHighSchoolYear:'2021',

      college: 'Global Reciprocal Colleges ',
      collegeYear: '2025',
    },

    about: ``,
   
   
    projects:
      {
        projectName: 'r-valcapsandjerseycollectives',
        imageSrc: '',
        link: 'http://r-valcapsandjerseycollectives.zya.me/',
        description: 'this project is a sales system also you can see here the revenue of the store  ',
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

{currentSection === 'contact' && (
            <View style={styles.contactContainer}>
              <Text style={styles.header1}>Contact Me:{'\n'}</Text>
              <Text style={styles.info1}>
                {'\n'}Mobile: {resumeData.contact.mobile}
                {'\n'}Email: {resumeData.contact.email}
              </Text>
            </View>
          )}

        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  contentContainer: {
    alignItems: 'center',
    maxWidth: 600,
  },
  image: {
    width: 150,
    height: 150,
    borderRadius: 75,
    marginBottom: 20,
  },
  textContainer: {
    alignSelf: 'stretch',
  },
  header: {
    fontSize: 35,
    fontWeight: 'bold',
    marginBottom: 5,
    textAlign: 'center',
  },
  header1: {
    fontSize: 30,
    fontWeight: 'bold',
    marginBottom: 5,
    textAlign: 'left',
  },
  info: {
    fontSize: 20,
    alignSelf: 'flex-start',
    textAlign: 'center',
  },
  info1: {
    fontSize: 20,
    alignSelf: 'flex-start',
    textAlign: 'left',

  },
  about: {
    fontSize: 20,
    textAlign: 'left',
    alignSelf: 'flex-start',
  },
   projectsContainer: {
    alignSelf: 'stretch',
    marginTop: 20,
  },
  projectTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 5,
    textAlign: 'left',
  },
  projectImage: {
    width: 300,
    height: 300,
    marginBottom: 10,
    alignSelf: 'center',
  },
  projectLink: {
    fontSize: 16,
    marginBottom: 5,
    textAlign: 'center',
  },
  projectDescription: {
    fontSize: 16,
    marginBottom: 10,
    textAlign: 'justify',
  },


});

export default App;
