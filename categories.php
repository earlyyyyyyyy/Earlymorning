<?php include('partials-front/menu.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Important to make website responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rval Website</title>

    <!-- Link our CSS file -->
    <link rel="stylesheet" href="css/style.css">
</head>





    <!-- CAtegories Section Starts Here -->
   
    <section class="categories">
        <div class="container">
            <h2 class="text-center">Explore Product</h2>
            
            <?php
             //DISPLAY ALL THE CATEGORIES THAT ARE ACTIVE 
             //SQL QUERY
             $sql = "SELECT * FROM tbl_category WHERE active='Yes' ";
             
             //EXECUTE THE QUERY 
             $res = mysqli_query($conn, $sql);

             //COUNT ROWS 
             $count = mysqli_num_rows($res);

             //CHECK WHETHER CATEGORIES AVAILABLE OR NOT
             if($count>0)
             {
                //categories available 
                while($row=mysqli_fetch_assoc($res))
                {
                    //GET THE VALUES
                    $id = $row['id'];
                    $title = $row['title'];
                    $image_name = $row['image_name'];
                    ?>
               <a href="<?php echo SITEURL; ?>category-item.php?category_id=<?php echo $id;  ?>">
               <div class="box-3 float-container">
                <?php
                if($image_name=="")
                {
                    //IMAGE NOT AVAILABLE
                    echo "<div class='error'>Image not found.</div>";
                }
                else
                {
                    //IMAGE AVAILABLE
                    ?>
                     <img src="<?php echo SITEURL; ?>images/category/<?php echo $image_name; ?>" alt="miami_short" class="img-responsive img-curve"> 
                    <?php
                }
                ?>

                

                <h3 class="float-text text-white"><?php echo $title; ?></h3>
            </div>
            </a>


                    <?php
                }
             }
             else
             {
              //categories not available 
              echo "<div class='error'>Category not found.</div>"; 
             }
            ?>

            
            
            

            <div class="clearfix"></div>
        </div>
    </section>
    <!-- Categories Section Ends Here -->


    <?php include('partials-front/footer.php'); ?>

</body>
</html>