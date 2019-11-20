package main

import (
	"net/http"
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

		return c.String(http.StatusOK, "Hello, World!")
	})
	e.Logger.Fatal(e.Start(":1323"))
}
