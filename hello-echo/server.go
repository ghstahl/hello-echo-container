package main

import (
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"

	"go.uber.org/zap"
)

func newSugar() (sugar *zap.SugaredLogger, logger *zap.Logger, err error) {
	logger, err = zap.NewProduction()
	if err != nil {
		return
	}
	sugar = logger.Sugar()
	return
}
func main() {
	e := echo.New()
	e.Use(middleware.Logger())
	e.GET("/", func(c echo.Context) error {

		sugar, logger, err := newSugar()
		if err != nil {
			panic(err)
		}
		defer logger.Sync() // flushes buffer, if any
		sugar.Infow("failed to fetch URL",
			// Structured context as loosely typed key-value pairs.
			"url", "https://33",
			"attempt", 3,
			"backoff", time.Second,
		)

		return c.String(http.StatusOK, "Landing Page!")
	})
	e.GET("/hello", func(c echo.Context) error {

		sugar, logger, err := newSugar()
		if err != nil {
			panic(err)
		}
		defer logger.Sync() // flushes buffer, if any
		sugar.Infow("failed to fetch URL",
			// Structured context as loosely typed key-value pairs.
			"url", "https://33",
			"attempt", 3,
			"backoff", time.Second,
		)

		return c.String(http.StatusOK, "Hello, World!")
	})
	port := getPort()
	e.Logger.Fatal(e.Start(fmt.Sprintf(":%v", port)))
}
func getPort() string {
	port := os.Getenv("PORT")
	if len(port) == 0 {
		return "1323"
	}
	return port
}
