export async function getActivities(){
  const response = await fetch(
    "https://a4b3-81-200-30-66.eu.ngrok.io/activities",
    {
      method: "GET",
    }
  );
  if(response.ok === true){
    const out = await response.json()
    console.log(out)
    return(out);
  } else {
    console.log("ERROR in getActivities");
    const out = await response.json();
    console.log(out)
    return(out);
  }
}