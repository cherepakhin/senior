public class Network {

    List<Callable<String>> tasks;
    int repeats;

    public Network(String[] args) {

        var ip = args[2];
        var urls = IntStream.range(0, Integer.parseInt(args[0]))
                .mapToObj(i -> "http://" + ip + ":8080/?i=" + i).toList();
        tasks = urls.stream().map(url -> (Callable<String>) () -> fetchURL(url)).toList();

        repeats = Integer.parseInt(args[1]);
    }

    HttpClient client = HttpClient.newBuilder().followRedirects(HttpClient.Redirect.NEVER).build();

    String fetchURL(String url) throws IOException, InterruptedException {
        var request = HttpRequest.newBuilder().uri(URI.create(url)).build();
        return client.send(request, HttpResponse.BodyHandlers.ofString()).body();
    }

    String execute(ExecutorService executor) throws Exception {
        try (executor) {
            var s = System.currentTimeMillis();
            var sum = executor.invokeAll(tasks).stream().mapToInt(f -> Integer.valueOf(f.resultNow())).sum();
            return (System.currentTimeMillis() - s) + "\t" + sum;
        }
    }

    void assessExecutors() throws Exception {
        System.out.println("CPU count " + Runtime.getRuntime().availableProcessors());
        System.out.println("cached\t\t\tvirtual");
        System.out.println("time\tsum\t\ttime\tsum");
        for (var i = 0; i < repeats; i++) {
            var cached = execute(Executors.newCachedThreadPool());
            var virtual = execute(Executors.newVirtualThreadPerTaskExecutor());
            System.out.println(cached + "\t\t" + virtual);
        }
    }

    public static void main(String[] args) throws Exception {
        new Network(args).assessExecutors();
    }
}