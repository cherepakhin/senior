    @Test
    void existTempFile() {
        //File
        assertTrue(new File("/home/vasi/temp/temp_file.txt").isFile()); //OK
        assertTrue(new File("/home/vasi/temp/temp_file.txt").exists()); //OK
        assertTrue(new File("/home/vasi/temp").exists()); //OK

        //Paths
        Path path = Paths.get("/home/vasi/temp/temp_file.txt");
        assertTrue(Files.exists(path)); //OK
        assertTrue(path.toFile().exists()); //OK
    }
